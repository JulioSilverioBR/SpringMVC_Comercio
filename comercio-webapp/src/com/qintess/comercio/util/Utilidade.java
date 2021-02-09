package com.qintess.comercio.util;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

import com.qintess.comercio.model.Produto;
import com.qintess.comercio.model.Propaganda;

public class Utilidade {
	public String encodaImagem(Produto produto) throws UnsupportedEncodingException {
		byte[] encodeBase64 = Base64.getEncoder().encode(produto.getImagemProd());
		produto.setImagemEncoded(new String(encodeBase64, "UTF-8"));
		return new String(encodeBase64,"UTF-8");
	}
	
	public String encodaImagem(Propaganda propaganda) throws UnsupportedEncodingException {
		byte[] encodeBase64 = Base64.getEncoder().encode(propaganda.getImagemProp());
		propaganda.setImagemEncoded(new String(encodeBase64, "UTF-8"));
		return new String(encodeBase64,"UTF-8");
	}
}
