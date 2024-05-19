/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package quanvn;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextArea;

/**
 *
 * @author quant
 */
public class sliderDetails extends JFrame {
    public sliderDetails(Slider slider) {
        this(slider, false);
    }

    public sliderDetails(Slider slider, boolean editable) {
        setTitle("Slider Details");
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setSize(400, 300);
        setLocationRelativeTo(null);

        JLabel imageLabel = new JLabel(slider.getImage());
        JLabel titleLabel = new JLabel(slider.getTitle());
        JLabel backlinkLabel = new JLabel(slider.getBacklink());
        JLabel statusLabel = new JLabel(slider.isStatus() ? "Active" : "Inactive");
        JTextArea notesTextArea = new JTextArea(slider.getNotes());
        notesTextArea.setEditable(editable);

        add(imageLabel, "North");
        add(titleLabel, "North");
        add(backlinkLabel, "Center");
        add(statusLabel, "South");
        add(notesTextArea, "South");
    }
}

