package com.qintess.comercio.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class Compra {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private LocalDate dtCompra;
	
	@Column(nullable = false, scale = 2)
	private BigDecimal valor = new BigDecimal(0);
	
	@ManyToOne
	@JoinColumn(name = "cliente_id", nullable = false)
	private Cliente cliente;
	
	@OneToMany(mappedBy = "compra", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<CompraProduto> produtos = new ArrayList<CompraProduto>();
	
	public void adicionaProduto(Produto produto, int quantidade) {
		CompraProduto compraProduto = new CompraProduto(this, produto, quantidade);
		produtos.add(compraProduto);
		produto.getCompras().add(compraProduto);;
		
		double valorCompra = this.valor.doubleValue();
		double valorProdutoUnit = produto.getValorUnitario().doubleValue();
		
		valorCompra += (valorProdutoUnit * quantidade);
		
		this.valor = new BigDecimal(valorCompra);
	}
	
}

