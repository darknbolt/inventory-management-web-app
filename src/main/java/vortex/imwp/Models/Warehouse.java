package vortex.imwp.Models;

import jakarta.persistence.*;

@Entity
@Table(name = "Warehouse")
public class Warehouse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String address;
}
