/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.Household;

/**
 *
 * @author Vinh
 */
public class HouseholdDAO extends GenericDAO<Household>{

    @Override
    public List<Household> findAll() {
        
//        //dinh nghia ra cau lenh sql
//        String sql = "SELECT *\n"
//                + " FROM [dbo].[Account]";
//        //khoi tao moi parameter map(optional)
//        
//        //lay ve du lieu
//        List<Account> list = queryGenericDAO(Account.class);
//        //tra ve du lieu
//        return list;
        return queryGenericDAO(Household.class);
    }

    @Override
    public int insert(Household t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
