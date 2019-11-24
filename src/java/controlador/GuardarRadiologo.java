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
import modelo.Radiologo;

/**
 *
 * @author DARWINFLORES
 */
public class GuardarRadiologo extends HttpServlet {

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
            out.println("<title>Servlet GuardarRadiologo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardarRadiologo at " + request.getContextPath() + "</h1>");
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
        
         if (request.getParameter("nombres")!=null && request.getParameter("apellidos")!=null) { //Verificando que no vengan realmente campos vacios
               //Creando objeto a la clase radiografía
        Radiologo radiolo = new Radiologo();
        //Capturando variables del formulario
        String nombre = request.getParameter("nombres");
        String apellido = request.getParameter("apellidos");
        
        //enviando valores a los metodos getter and setter
        radiolo.setNombre(nombre);
        radiolo.setApellido(apellido);

        if (radiolo.insertardatos()) { //llamando funcion de insercion de datos
            response.sendRedirect("radiologo/?g=exito");//Redireccionando a la mismas pagina 
            //pero con parametro para mostrar mensaje respectivo
        } else {
            response.sendRedirect("radiologo/?g=error");
        }
        
        }else{
             response.sendRedirect("radiologo/?g=vacio");
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
