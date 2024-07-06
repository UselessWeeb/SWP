/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author M7510
 */
public class testing {
    public static void main(String[] args) {
        HiddenUrlDAO dao = new HiddenUrlDAO();
        System.out.println(dao.fetchPaginatedUrls(0, 10));
    }
}
