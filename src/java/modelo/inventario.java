
package modelo;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class inventario {
    
    private int id;
    private String codigo;
    private String descripcion;
    private String stock;
    private String costo;
    private String precio;
    private String proveedor;
    private String minimo;

    public inventario() {
    }

    public inventario(int id, String codigo, String descripcion, String stock, String costo, String precio, String proveedor, String minimo) {
        this.id = id;
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.stock = stock;
        this.costo = costo;
        this.precio = precio;
        this.proveedor = proveedor;
        this.minimo = minimo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getCosto() {
        return costo;
    }

    public void setCosto(String costo) {
        this.costo = costo;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getMinimo() {
        return minimo;
    }

    public void setMinimo(String minimo) {
        this.minimo = minimo;
    }

  
}
