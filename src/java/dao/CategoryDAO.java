/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Category;
import model.Channel;
import model.Comment;

/**
 *
 * @author acer
 */
public class CategoryDAO extends DBContext{
    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> categories = new ArrayList<>();
        try {
            String sql = "SELECT * FROM categories";
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setCreatedAt(rs.getString("created_at"));
                c.setName(rs.getNString("name"));
                c.setSlug(rs.getString("slug"));
                
                categories.add(c);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return categories;
    }
}
