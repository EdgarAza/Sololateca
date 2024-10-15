/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reportes;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
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
public class reportesProveedores {
    
    private Connection connection;

    public reportesProveedores(Connection connection) {
        this.connection = connection;
    }

    public void ProveedoresCompleto() {
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

            String rutaPDF = "C:\\reportes\\reporte_proveedores" + "_" + fdias + "-" + fmes + "-" + fanio + ".pdf";
            FileOutputStream archivo = new FileOutputStream(rutaPDF);
            Document doc = new Document(PageSize.A4);
            PdfWriter.getInstance(doc, archivo);
            doc.open();
            // Agregar imagen (ajusta la ruta según tu necesidad)
            //  com.itextpdf.text.Image img = com.itextpdf.text.Image.getInstance("C:\\sistema\\recursos\\logoInventario.png");
            // img.setAbsolutePosition(33f, 734f);
            //img.scalePercent(21);
            // doc.add(img);

            doc.add(new Paragraph("PROVEEDORES", titulos));
            doc.add(new Paragraph("Fecha: " + fdia));
            doc.add(new Paragraph(" "));

            PdfPTable titulo = new PdfPTable(8);
            titulo.setWidthPercentage(100);
            float[] comnom1 = new float[]{10f, 35f, 40f, 30f, 25f, 25f, 25f, 25f};
            titulo.setWidths(comnom1);
            titulo.addCell(new Phrase("No.", normals));
            titulo.addCell(new Phrase("Codigo", normals));
            titulo.addCell(new Phrase("Nombre", normals));
            titulo.addCell(new Phrase("Comercial", normals));
            titulo.addCell(new Phrase("Direccion", normals));
            titulo.addCell(new Phrase("Correo", normals));
            titulo.addCell(new Phrase("Telefono", normals));
            titulo.addCell(new Phrase("Nota", normals));

            doc.add(titulo);

            PdfPTable tablax = new PdfPTable(8);
            tablax.setWidthPercentage(100);
            float[] comnom0 = new float[]{10f, 35f, 40f, 30f, 25f, 25f, 25f, 25f};
            tablax.setWidths(comnom0);

            double totalCompra = 0.00, totalVenta = 0.00, totalPro = 0;

            // Consultar los datos de la base de datos
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM proveedores");
            int contador = 0;
            while (rs.next()) {
                String vCodigo = rs.getString("codigo");
                String vNombre = rs.getString("nombre");
                String vComercial = rs.getString("comercial");
                String vDireccion = rs.getString("direccion");
                String vCorreo = rs.getString("correo");
                String vTelefono = rs.getString("telefono");
                String vNota = rs.getString("nota");
                contador++;
                tablax.addCell(new Phrase(String.valueOf(contador), normal));
                tablax.addCell(new Phrase(vCodigo, normal));
                tablax.addCell(new Phrase(vNombre, normal));
                tablax.addCell(new Phrase(vComercial, normal));
                tablax.addCell(new Phrase(vDireccion, normal));
                 tablax.addCell(new Phrase(vCorreo, normal));
                tablax.addCell(new Phrase(vTelefono, normal));
                tablax.addCell(new Phrase(vNota, normal));

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
