package com.qintess.comercio.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class Propaganda {
	@Id  @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private String nomePropaganda;
	
	@Lob
	@Column(nullable = false, length = 16777215)
	private byte[] imagemProp;
	
	@Transient 
	private String imagemEncoded;
}
