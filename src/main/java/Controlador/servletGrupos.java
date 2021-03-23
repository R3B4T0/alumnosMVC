/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Alumno;
import Modelo.Utilidades;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author David Rebato
 */
public class servletGrupos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ArrayList<String> grupos;
    private String rutaFicheros;
    
    public void init(ServletConfig config) throws ServletException{
        grupos = new ArrayList<String>();
        rutaFicheros = config.getServletContext().getRealPath("").concat(File.separator).concat("ficheros");
        grupos.add("2daw_a");
        grupos.add("2daw_b");
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
        String grupoSeleccionado="2daw_a";
        if(request.getParameter("grupo")!=null){
            grupoSeleccionado=request.getParameter("grupo");
        }
        ArrayList<Alumno> alumnos = Utilidades.getAlumnos(rutaFicheros.
               concat(File.separator).concat(grupoSeleccionado.replace(" ", "")).concat(".txt"));
        request.setAttribute("grupos",grupos);
        request.setAttribute("grupo", grupoSeleccionado);
        request.setAttribute("alumnos",alumnos);
        request.getRequestDispatcher("alumnos.jsp").forward(request, response);
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
        ArrayList<Alumno> alumnosSeleccionados = new ArrayList<Alumno>();
        String grupoSeleccionado=request.getParameter("grupo");
        ArrayList<Alumno> alumnos = Utilidades.getAlumnos(rutaFicheros.
               concat(File.separator).concat(grupoSeleccionado.replace(" ", "")).concat(".txt"));
        if("2daw_a".equals(grupoSeleccionado)){
            for(Alumno al: alumnos){
                if(request.getParameter(String.valueOf(al.getId()))!=null){
                    Alumno a = new Alumno(al.getId(),al.getNombre(),al.getApellidos(),al.getEmail());
                    alumnosSeleccionados.add(a);
                }
            }
        } else if ("2daw_b".equals(grupoSeleccionado)) {
            for(Alumno al: alumnos){
                if(request.getParameter(String.valueOf(al.getId()))!=null){
                    Alumno a = new Alumno(al.getId(),al.getNombre(),al.getApellidos(),al.getEmail());
                    alumnosSeleccionados.add(a);
                }
            }
        }
      
        request.setAttribute("grupo", grupoSeleccionado);
        request.setAttribute("alumnosSeleccionados", alumnosSeleccionados);
        request.getRequestDispatcher("resumen.jsp").forward(request, response);
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
