package com.qintess.comercio.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

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
import com.qintess.comercio.model.Propaganda;
import com.qintess.comercio.util.Utilidade;

@Controller
@RequestMapping("/propaganda")
public class PropagandaController {
	@Autowired
	private Dao dao;
	
	@RequestMapping("")
	public String carrega(Model model, RedirectAttributes redirectAtt) {
		List<Propaganda> propragandas = new ArrayList<Propaganda>();
		try {
		propragandas = dao.buscaTodos(Propaganda.class);
		Utilidade util = new Utilidade();
		for (Propaganda propaganda : propragandas) {
			
				propaganda.setImagemEncoded(util.encodaImagem(propaganda));
			
		}
		model.addAttribute("propaganda", new Propaganda());
		model.addAttribute("propagandas", propragandas);
		} catch (UnsupportedEncodingException e) {
			redirectAtt.addFlashAttribute("mensagemErro","ERRO GRAVE: "+e.getMessage());
		}
		return "propaganda";
	}
	
	@RequestMapping("/salva")
	public String salva(@ModelAttribute Propaganda propaganda,
						@RequestParam(required = false,value = "cancela")String cancela,
						@RequestParam(required = true,value = "imagem") MultipartFile imagem,
						RedirectAttributes redirectAttribute) {
		byte[] bImagem;
		try {
			if(cancela != null) {
				return "redirect:/propaganda";
			}
			
			if(imagem != null && imagem.getSize() > 0) {
				bImagem = imagem.getBytes();
				propaganda.setImagemProp(bImagem);
			}
			
			
			if(propaganda.getId() == 0) {
				dao.salva(propaganda);	
				redirectAttribute.addFlashAttribute("mensagemSucesso", "Propaganda cadastrada com sucesso");
			}else {
				dao.altera(propaganda);
				redirectAttribute.addFlashAttribute("mensagemSucesso", "Propaganda alterada com sucesso");
			}
		} catch (Exception e) {
			redirectAttribute.addFlashAttribute("mensagemErro", "Erro Grave: "+ e.getMessage());
		}
		
		return "redirect:/propaganda";
	}
	@RequestMapping("/deleta/{id}")
	public String deleta(@PathVariable(name = "id") int id,RedirectAttributes redirectAttribute) {
		Propaganda propaganda = dao.buscaPorId(Propaganda.class, id);
		
		dao.deleta(propaganda);
		redirectAttribute.addFlashAttribute("mensagemSucesso", "Propaganda deletada com sucesso");
		
		return "redirect:/propaganda";
	}
	@RequestMapping("altera/{id}")
	public String carregaAlterar(@PathVariable(name = "id")int id, Model model,RedirectAttributes redirectAtt) {

		try {
			Propaganda propaganda = dao.buscaPorId(Propaganda.class, id);
			Utilidade util = new Utilidade();
			propaganda.setImagemEncoded(util.encodaImagem(propaganda));
			
			List<Propaganda> propragandas = new ArrayList<Propaganda>();
			
				propragandas = dao.buscaTodos(Propaganda.class);
				for (Propaganda propaganda2 : propragandas) {
					propaganda2.setImagemEncoded(util.encodaImagem(propaganda2));
					
				}
				model.addAttribute("propagandas", propragandas);
				model.addAttribute("propaganda", propaganda);
		} catch (UnsupportedEncodingException e) {
			redirectAtt.addFlashAttribute("mensagemErro","ERRO GRAVE: "+e.getMessage());
		}
		return "propaganda";
		}
	}
