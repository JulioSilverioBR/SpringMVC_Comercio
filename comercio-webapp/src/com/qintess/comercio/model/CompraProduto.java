package com.qintess.comercio.model;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Compra_Produto")
@Getter @Setter
public class CompraProduto {

	@EmbeddedId
	private CompraProdutoId id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("compraId")
	private Compra compra;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("produtoId")
	private Produto produto;
	
	@Column(nullable = false)
	private int quantidade;

	@SuppressWarnings("unused")
	private CompraProduto() {}
	
	public CompraProduto(Compra compra, Produto produto, int quantidade) {
		this.compra = compra;
		this.produto = produto;
		this.quantidade = quantidade;
		this.id = new CompraProdutoId(compra.getId() , produto.getId());
	}
}
