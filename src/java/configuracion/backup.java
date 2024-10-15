/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package configuracion;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class backup {
    
   
    public void ejecutar(){
                                                  
    // Dirección del directorio donde se encuentra el archivo
    String directoryPath = "C:\\reportes\\backup\\generar.bat";
    
    // Construir la ruta completa del archivo
    String filePath = directoryPath;

    try {
        // Determinar el programa predeterminado para abrir el archivo basado en su extensión
        ProcessBuilder processBuilder;
        
        // En Windows, puedes usar "cmd /c start" para abrir con la aplicación predeterminada
        if (System.getProperty("os.name").toLowerCase().contains("win")) {
            processBuilder = new ProcessBuilder("cmd", "/c", "start", filePath);
        } else {
            // Para otros sistemas operativos, ajustar según sea necesario
            throw new UnsupportedOperationException("Sistema operativo no soportado en este ejemplo.");
        }

        // Redirige cualquier error al stream de salida estándar
        processBuilder.redirectErrorStream(true);

        // Iniciar el proceso
        Process process = processBuilder.start();

        // Leer la salida del proceso (aunque no es necesario para abrir un archivo)
        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String line;
        while ((line = reader.readLine()) != null) {
            System.out.println(line); // O maneja la salida como desees
        }

        // Esperar a que el proceso termine (opcional)
        int exitCode = process.waitFor();
   
    } catch (IOException | InterruptedException ex) {
        ex.printStackTrace();
    }

    }
    
    
}
