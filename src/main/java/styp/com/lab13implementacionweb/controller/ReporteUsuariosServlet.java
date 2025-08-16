package styp.com.lab13implementacionweb.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import styp.com.lab13implementacionweb.dao.ConnectionDB;

import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "ReporteUsuariosServlet", value = "/reporte-usuarios")
public class ReporteUsuariosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener la ruta del JRXML
        String jrxml = getServletContext().getRealPath("/WEB-INF/reportes/usuarios.jrxml");
        System.out.println("Ruta JRXML: " + jrxml);

        try (Connection conn = ConnectionDB.getConnection()) {
            System.out.println("Conexión abierta: " + (conn != null));

            // Compilar y llenar el reporte
            JasperReport report = JasperCompileManager.compileReport(jrxml);
            JasperPrint print = JasperFillManager.fillReport(report, null, conn);

            // Configurar la respuesta HTTP para PDF
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=usuarios.pdf");

            // Exportar el PDF
            JRPdfExporter exporter = new JRPdfExporter();
            exporter.setExporterInput(new SimpleExporterInput(print));
            exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(response.getOutputStream()));
            exporter.exportReport();

        } catch (JRException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error JasperReports: " + e.getMessage());
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error SQL: " + e.getMessage());
        }
    }
}