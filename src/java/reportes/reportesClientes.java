/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reportes;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class reportesClientes {

    private Connection connection;

    public reportesClientes(Connection connection) {
        this.connection = connection;
    }

    public void ClientesCompleto() {
        DateTimeFormatter anio = DateTimeFormatter.ofPattern("yyyy");
        DateTimeFormatter dia = DateTimeFormatter.ofPattern("dd");
        DateTimeFormatter mes = DateTimeFormatter.ofPattern("MM");
        String fanio = anio.format(LocalDateTime.now());
        String fdias = dia.format(LocalDateTime.now());
        String fmes = mes.format(LocalDateTime.now());
        DateTimeFormatter fechaFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String fdia = fechaFormatter.format(LocalDateTime.now());

        try {
            Font normal = new Font(Font.FontFamily.UNDEFINED, 9, Font.NORMAL, BaseColor.BLACK);
            Font normals = new Font(Font.FontFamily.UNDEFINED, 10, Font.BOLD, BaseColor.BLACK);
            Font titulos = new Font(Font.FontFamily.UNDEFINED, 25, Font.BOLD, BaseColor.BLACK);

            String rutaPDF = "C:\\reportes\\reporte_clientes" + "_" + fdias + "-" + fmes + "-" + fanio + ".pdf";
            FileOutputStream archivo = new FileOutputStream(rutaPDF);
            Document doc = new Document(PageSize.A4);
            PdfWriter.getInstance(doc, archivo);
            doc.open();
            // Agregar imagen (ajusta la ruta según tu necesidad)
            //  com.itextpdf.text.Image img = com.itextpdf.text.Image.getInstance("C:\\sistema\\recursos\\logoInventario.png");
            // img.setAbsolutePosition(33f, 734f);
            //img.scalePercent(21);
            // doc.add(img);

            doc.add(new Paragraph("CLIENTES", titulos));
            doc.add(new Paragraph("Fecha: " + fdia));
            doc.add(new Paragraph(" "));

            PdfPTable titulo = new PdfPTable(5);
            titulo.setWidthPercentage(100);
            float[] comnom1 = new float[]{10f, 50f, 30f, 30f, 40f};
            titulo.setWidths(comnom1);
            titulo.addCell(new Phrase("No.", normals));
            titulo.addCell(new Phrase("Nombre", normals));
            titulo.addCell(new Phrase("Telefono", normals));
            titulo.addCell(new Phrase("Correo", normals));
            titulo.addCell(new Phrase("Direccion", normals));

            doc.add(titulo);

            PdfPTable tablax = new PdfPTable(5);
            tablax.setWidthPercentage(100);
            float[] comnom0 = new float[]{10f, 50f, 30f, 30f, 40f};
            tablax.setWidths(comnom0);

            // Consultar los datos de la base de datos
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM clientes");
            int contador = 0;
            while (rs.next()) {
                String vNombre = rs.getString("nombre");
                String vTelefono = rs.getString("telefono");
                String vCorreo = rs.getString("correo");
                String vDireccion = rs.getString("direccion");
                contador++;
                tablax.addCell(new Phrase(String.valueOf(contador), normal));
                tablax.addCell(new Phrase(vNombre, normal));
                tablax.addCell(new Phrase(vTelefono, normal));
                tablax.addCell(new Phrase(vCorreo, normal));
                tablax.addCell(new Phrase(vDireccion, normal));

            }

            doc.add(tablax);

            doc.close();
            archivo.close();

            try {
                File pdfFile = new File(rutaPDF);
                Desktop.getDesktop().open(pdfFile);
            } catch (Exception e) {
                System.err.println("Error al abrir el PDF: " + e);
            }

        } catch (Exception e) {
            System.err.println("Error al generar el PDF: " + e);
        }
    }
}
