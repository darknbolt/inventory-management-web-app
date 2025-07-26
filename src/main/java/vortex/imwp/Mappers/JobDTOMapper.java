package vortex.imwp.Mappers;

import vortex.imwp.DTOs.JobDTO;
import vortex.imwp.Models.Job;

public class JobDTOMapper {
    public static JobDTO map(Job job) {
        return new JobDTO(
                job.getName(),
                job.getDescription()
        );
    }
}
