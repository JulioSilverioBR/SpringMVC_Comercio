package com.qintess.comercio.model;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class Cliente {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	private int id;
	
	@Column(nullable = false)
	private String nome;
	
	
	@Column(nullable = false)
	private String email;
	
	@Column(nullable = false)
	private String senha;
	
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	@Column(nullable = false)
	private LocalDate dtNascimento;
	
	@OneToMany(cascade =  CascadeType.ALL,mappedBy = "cliente", fetch = FetchType.EAGER)
	private List<Compra> compras;
	 
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "cliente")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Papel> papeis;
}
