/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Paciente;

/**
 *
 * @author DARWINFLORES
 */
public class GuardarPaciente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuardarRadiografia</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardarRadiografia at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          try {
            int id = Integer.parseInt(request.getParameter("id"));
            //Enviando los datos a los datos getter and setter
        Paciente pace = new Paciente();
            pace.setId(id);
            if (pace.eliminarDatos()) {
                response.sendRedirect("paciente/?g=eliminado");//Redireccionando a la mismas pagina 
            }
            
        } catch (Exception e) {
            response.sendRedirect("paciente/?g=eliminadoerror");//Redireccionando a la mismas pagina 
        }
    
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = "", nombre = "", apellido = "", genero = "", fecha = "", referencia = "", direccion;
        int id_radiografia = 0, id_radiologo = 0;
        double descuento = 0.0, total_pago = 0.0, precio = 0.0;
        //Captura de Datos
        codigo = request.getParameter("codigo");
        nombre = request.getParameter("nombre");
        apellido = request.getParameter("apellido");
        genero = request.getParameter("genero");
        fecha = request.getParameter("fecha");
        referencia = request.getParameter("referencia");
        direccion = request.getParameter("direccion");
        id_radiografia = Integer.parseInt(request.getParameter("tipo_radiografia"));
        id_radiologo = Integer.parseInt(request.getParameter("radiologo"));
        try {
            descuento = Double.parseDouble(request.getParameter("descuento"));
        } catch (Exception e) {
            System.out.println("Error"+e.getMessage());
        }
            
        total_pago = Double.parseDouble(request.getParameter("totalpago"));
        precio = Double.parseDouble(request.getParameter("precio"));

        //Enviando los datos a los datos getter and setter
        Paciente paciente = new Paciente();
        paciente.setCodigo(codigo);
        paciente.setNombre(nombre);
        paciente.setApellido(apellido);
        paciente.setGenero(genero);
        paciente.setDireccion(direccion);
        paciente.setFecha(fecha);
        paciente.setReferencia(referencia);
        paciente.setTotal(total_pago);
        paciente.setDescuento(descuento);
        paciente.setRadiografia_id(id_radiografia);
        paciente.setRadiologo_id(id_radiologo);
        paciente.setPrecioActual_rad(precio);

        if (paciente.insertardatos() == true) { //llamando funcion de insercion de datos
            response.sendRedirect("paciente/?g=exito");//Redireccionando a la mismas pagina 
            //pero con parametro para mostrar mensaje respectivo
        } else {
            response.sendRedirect("paciente/?g=error");
        }

        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
