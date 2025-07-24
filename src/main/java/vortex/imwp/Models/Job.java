package vortex.imwp.Models;

import jakarta.persistence.*;

@Entity
@Table(name = "Job")
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;

    public String getName() {return this.name;}
}
