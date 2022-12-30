package com.JPARepository.model;

import java.util.Objects;
import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "offices")
public class Office {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long officeId;

    @Basic(optional = false)
    @Column(nullable = false)
    private String officeName;

    private int nrOfEmployees;

    public Office() {
    }

    public Office(String officeName, int nrOfEmployees) {
        this.officeName = officeName;
        this.nrOfEmployees = nrOfEmployees;
    }

    public Long getOffice_id() {
        return officeId;
    }

    public void setId(Long officeId) {
        this.officeId = officeId;
    }

    public String getOffice_name() {
        return officeName;
    }

    public void setOffice_name(String officeName) {
        this.officeName = officeName;
    }

    public int getNo_of_employees() {
        return nrOfEmployees;
    }

    public void setNo_of_employees(int nrOfEmployees) {
        this.nrOfEmployees = nrOfEmployees;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + Objects.hashCode(this.officeId);
        hash = 79 * hash + Objects.hashCode(this.officeName);
        hash = 79 * hash + this.nrOfEmployees;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Office other = (Office) obj;
        if (this.nrOfEmployees != other.nrOfEmployees) {
            return false;
        }
        if (!Objects.equals(this.officeName, other.officeName)) {
            return false;
        }
        return Objects.equals(this.officeId, other.officeId);
    }

    @Override
    public String toString() {
        var builder = new StringBuilder();
        builder.append("Office{id=").append(officeId).append(", officeName=")
                .append(officeName).append(", nrOfEmployees=")
                .append(nrOfEmployees).append("}");
        return builder.toString();
    }

}
