package com.qintess.comercio.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;

import lombok.Getter;
import lombok.Setter;

@Embeddable
@Getter @Setter
public class CompraProdutoId implements Serializable {
	private static final long serialVersionUID = 1L;

	private int compraId;
	
	private int produtoId;
	
	@SuppressWarnings("unused")
	private CompraProdutoId() {}
	
	public CompraProdutoId(int compraId, int produtoId) {
		this.compraId = compraId;
		this.produtoId = produtoId;
	}
	
	// � necess�rio fazer a implementa��o dos m�todos equals e hashcode
	@Override
	public boolean equals(Object o) {
		if(this == o) return true;
		
		if(o == null || getClass() != o.getClass())
			return false;
		
		CompraProdutoId that = (CompraProdutoId) o;
		return Objects.equals(compraId, that.compraId) &&
			   Objects.equals(produtoId, that.produtoId);
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(compraId, produtoId);
	}
}