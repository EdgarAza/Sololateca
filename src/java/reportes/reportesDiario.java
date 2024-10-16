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
public class reportesDiario {

    private Connection connection;

    public reportesDiario(Connection connection) {
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

            doc.add(new Paragraph("VENTA DIARIA", titulos));
            doc.add(new Paragraph("Fecha: " + fdia));
            doc.add(new Paragraph(" "));

            PdfPTable titulo = new PdfPTable(8);
            titulo.setWidthPercentage(100);
            float[] comnom1 = new float[]{10f, 40f, 40f, 30f, 20f, 45f, 30f, 30f};
            titulo.setWidths(comnom1);
            titulo.addCell(new Phrase("No.", normals));
            titulo.addCell(new Phrase("Cliente", normals));
            titulo.addCell(new Phrase("Vendedor", normals));
            titulo.addCell(new Phrase("Codigo", normals));
            titulo.addCell(new Phrase("Cantidad", normals));
            titulo.addCell(new Phrase("Descripcion", normals));
            titulo.addCell(new Phrase("Precio", normals));
            titulo.addCell(new Phrase("Subtotal", normals));

            doc.add(titulo);

            PdfPTable tablax = new PdfPTable(8);
            tablax.setWidthPercentage(100);
            float[] comnom0 = new float[]{10f, 40f, 40f, 30f, 20f, 45f, 30f, 30f};
            tablax.setWidths(comnom0);

            // Consultar los datos de la base de datos
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM diario");
            int contador = 0;
            double suma= 00;
            while (rs.next()) {
                String vCliente = rs.getString("cliente");
                String vVendedor = rs.getString("vendedor");
                String vCodigo = rs.getString("codigo");
                String vCantidad = rs.getString("cantidad");
                String vDescripcion = rs.getString("descripcion");
                String vPrecio = rs.getString("precio");
                Double vSubtotal = rs.getDouble("subtotal");
                contador++;
                suma += vSubtotal;
                tablax.addCell(new Phrase(String.valueOf(contador), normal));
                tablax.addCell(new Phrase(vCliente, normal));
                tablax.addCell(new Phrase(vVendedor, normal));
                tablax.addCell(new Phrase(vCodigo, normal));
                tablax.addCell(new Phrase(vCantidad, normal));
                tablax.addCell(new Phrase(vDescripcion, normal));
                tablax.addCell(new Phrase("Q." + vPrecio, normal));
                tablax.addCell(new Phrase("Q." + vSubtotal, normal));


            }

            doc.add(tablax);

             Paragraph info = new Paragraph();
            info.add(Chunk.NEWLINE);
            info.add("Total de venta: Q." + suma);
            info.setAlignment(Element.ALIGN_RIGHT);
            doc.add(info);
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
