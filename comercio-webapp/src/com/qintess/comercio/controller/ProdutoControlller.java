package com.qintess.comercio.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qintess.comercio.dao.Dao;
import com.qintess.comercio.model.Produto;
import com.qintess.comercio.util.Utilidade;

@Controller
@RequestMapping("/produto")
public class ProdutoControlller {
	@Autowired
	private Dao dao;
	
	@RequestMapping("")
	public String carrega(Model model) {
		model.addAttribute("produtos", dao.buscaTodos(Produto.class));

		model.addAttribute("produto", new Produto());
		return "produto";
	}
	@RequestMapping("/salva")
	public String salva(@ModelAttribute Produto produto,
						@RequestParam(required = false,value = "cancela")String cancela,
						@RequestParam(required = false,value = "imagem") MultipartFile imagem,
						RedirectAttributes redirectAttribute) {
		byte[] bImagem;
		try {
			if(cancela != null) {
				return "redirect:/produto";
			}
			
			if(imagem != null && imagem.getSize() > 0) {
				bImagem = imagem.getBytes();
				produto.setImagemProd(bImagem);
			}
			
			
			if(produto.getId() == 0) {
				dao.salva(produto);	
				redirectAttribute.addFlashAttribute("mensagemSucesso", "Produto cadastrado com sucesso");
			}else {
				dao.altera(produto);
				redirectAttribute.addFlashAttribute("mensagemSucesso", "Produto alterado com sucesso");
			}
		} catch (Exception e) {
			redirectAttribute.addFlashAttribute("mensagemErro", "Erro Grave: "+ e.getMessage());
		}
		
		return "redirect:/produto";
	}
	@RequestMapping("/deleta/{id}")
	public String deleta(@PathVariable(name = "id") int id,RedirectAttributes redirectAttribute) {
		Produto produto = dao.buscaPorId(Produto.class, id);
		
		dao.deleta(produto);
		redirectAttribute.addFlashAttribute("mensagemSucesso", "Produto deletado com sucesso");
		
		return "redirect:/produto";
	}
	@RequestMapping("altera/{id}")
	public String carregaAlterar(@PathVariable(name = "id")int id, Model model,RedirectAttributes redirectAtt) {

		try {
			Produto produto = dao.buscaPorId(Produto.class, id);
			Utilidade util = new Utilidade();
			produto.setImagemEncoded(util.encodaImagem(produto));
			
			model.addAttribute("produtos", dao.buscaTodos(Produto.class));
			model.addAttribute("produto", produto);
		} catch (UnsupportedEncodingException e) {
			redirectAtt.addFlashAttribute("mensagemErro","ERRO GRAVE: "+e.getMessage());
		}
		
		return "produto";
	}
}
