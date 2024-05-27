/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextArea;
import model.Slider;

/**
 *
 * @author quant
 */
public class SliderDetails extends JFrame {
    public SliderDetails(Slider slider) {
        this(slider, false);
    }

    public SliderDetails(Slider slider, boolean editable) {
        setTitle("Slider Details");
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setSize(400, 300);
        setLocationRelativeTo(null);

        JLabel imageLabel = new JLabel(slider.getImages());
        JLabel titleLabel = new JLabel(slider.getTitle());
        JLabel backlinkLabel = new JLabel(slider.getBacklink());
        JLabel statusLabel = new JLabel(slider.getStatus() == 1 ? "Active" : "Inactive");
        JTextArea detailsTextArea = new JTextArea(slider.getDetails());
        detailsTextArea.setEditable(editable);

        add(imageLabel, "North");
        add(titleLabel, "North");
        add(backlinkLabel, "Center");
        add(statusLabel, "South");
        add(detailsTextArea, "South");

        setVisible(true);
    }
}