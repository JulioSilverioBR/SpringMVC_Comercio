package com.qintess.comercio.controller;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qintess.comercio.dao.Dao;
import com.qintess.comercio.model.Produto;
import com.qintess.comercio.model.Propaganda;

@Controller
public class IndexController {
	
	@Autowired
	private Dao dao;
	
	@RequestMapping("/")
	public String index(Model model) {
		
		try {
			List<Produto> produtos = dao.buscaTodos(Produto.class);
			model.addAttribute("produtos", encodaImagemProduto(produtos));
			
			
			List<Propaganda> propaganda = dao.buscaTodos(Propaganda.class);
			model.addAttribute("propagandas", encodaImagemPropaganda(propaganda));
		 
		} catch (UnsupportedEncodingException e) {
			model.addAttribute("mensagemErro", "ERRO GRAVE: " + e.getMessage());
		}
		
		return "index";
	}
	
	@RequestMapping("/menu")
	public String menu(Model model) {
		Authentication auth = SecurityContextHolder.getContext()
                .getAuthentication();
		
		model.addAttribute("usuarioLogado", auth);
		return "menu";
	}
	
	@RequestMapping("/menuLateral")
	public String menuLateral(Model model) {
		Authentication auth = SecurityContextHolder.getContext()
                .getAuthentication();
		
		model.addAttribute("usuarioLogado", auth);
		return "menuLateral";
	}
	
	@RequestMapping("/rodape")
	public String rodape() {
		return "rodape";
	}

	private List<Produto> encodaImagemProduto(List<Produto> produtos) throws UnsupportedEncodingException {
		
		for (Produto produto : produtos) {
			byte[] encodeBase64 = Base64.getEncoder().encode(produto.getImagemProd());
			produto.setImagemEncoded(new String(encodeBase64, "UTF-8"));
		}
		return produtos;
	}
	
private List<Propaganda> encodaImagemPropaganda(List<Propaganda> propagandas) throws UnsupportedEncodingException {
		
		for (Propaganda propaganda : propagandas) {
			byte[] encodeBase64 = Base64.getEncoder().encode(propaganda.getImagemProp());
			propaganda.setImagemEncoded(new String(encodeBase64, "UTF-8"));
		}
		return propagandas;
	}

}