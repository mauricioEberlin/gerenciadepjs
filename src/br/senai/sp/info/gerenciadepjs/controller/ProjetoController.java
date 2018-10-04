package br.senai.sp.info.gerenciadepjs.controller;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.senai.sp.info.gerenciadepjs.dao.ProjetoDAO;
import br.senai.sp.info.gerenciadepjs.dao.TecnologiaDAO;
import br.senai.sp.info.gerenciadepjs.model.Projeto;
import br.senai.sp.info.gerenciadepjs.model.Tecnologia;

@Controller
@RequestMapping("/app")
public class ProjetoController {
	
	@Autowired
	private ProjetoDAO dao;
	
	@Autowired
	private TecnologiaDAO daoTec;
	
	@GetMapping("/projeto")
	public String AbrirTelaProjetos (@RequestParam(required = false)Long id, Model model) {
		
		if(id == null) {
			model.addAttribute("projetos", dao.buscarTodos());	
		}else {
			model.addAttribute("projetos", dao.buscarPorTecnologia(id));		
		}	
		return "projeto/menu";
	}
	
	@GetMapping("/projeto/novo")
	public String AbrirTelaNovoProjeto(Model model) {
		
		model.addAttribute("projeto", new Projeto());
		model.addAttribute("tecnologias", daoTec.buscarTodos());
				
		return "projeto/form";
		
	}
	
	@GetMapping("/projeto/editar")
	public String AbrirEditarProjeto(@RequestParam(required = true)Long id, Model model) {
		
		model.addAttribute("projeto", dao.buscar(id));
		model.addAttribute("tecnologias", daoTec.buscarTodos());
		
		return "projeto/form";
	}
	
	@GetMapping("/projeto/visualizar")
	public String AbrirVerProjeto(@RequestParam(required = true)Long id, Model model) {
		
		model.addAttribute("projeto", dao.buscar(id));
		
		return "projeto/view";
	}
	
	@PostMapping("/projeto/salvar")
	public String salvar(@Valid Projeto projeto, BindingResult brprojeto, Model model) {
		
		if (dao.buscarPorNome(projeto.getNome()) != null) {
			brprojeto.addError(new FieldError("projeto", "nome", "O nome já existe"));
		}
		
		if (brprojeto.hasErrors()) {
			return "projeto/novo";
		}
		
		if (projeto.getId() == null) {
			dao.persistir(projeto);
		}else {
			Projeto projetoBanco = dao.buscar(projeto.getId());
			BeanUtils.copyProperties(projeto, projetoBanco, "id");
			dao.alterar(projetoBanco);
		}
		
		return "redirect:/app/projeto";
	}
	
	@GetMapping("/projeto/deletar")
	public String deletar(@RequestParam(name = "id", required = true)Long id) {
		dao.deletar(dao.buscar(id));
		return "redirect:/app/projeto";
	}	
}
