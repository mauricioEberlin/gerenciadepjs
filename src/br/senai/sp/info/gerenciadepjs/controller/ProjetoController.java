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
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.senai.sp.info.gerenciadepjs.dao.ProjetoDAO;
import br.senai.sp.info.gerenciadepjs.dao.TecnologiaDAO;
import br.senai.sp.info.gerenciadepjs.dao.UsuarioDAO;
import br.senai.sp.info.gerenciadepjs.model.Projeto;
import br.senai.sp.info.gerenciadepjs.model.Status;


@Controller
@RequestMapping("/app")
public class ProjetoController {
	
	@Autowired
	private ProjetoDAO dao;
	
	@Autowired
	private TecnologiaDAO daoTec;
	
	@Autowired
	private UsuarioDAO daoUsr;
	
	@GetMapping("/projeto")
	public String AbrirTelaProjetos (@RequestParam(name = "idStatus", required = false)Long idStatus, 
									 @RequestParam(name = "idTec", required = false)Long id, 
									 @RequestParam(name = "pesquisa", required = false)String nome, 
									 Model model) {
		
		if(id == null && idStatus == null && nome == null) {
			model.addAttribute("projetos", dao.buscarTodos());	
		}
		
		if(nome != null) {
			model.addAttribute("projetos", dao.pesquisarPorNome(nome));
		}
		
		if(id != null) {
			model.addAttribute("projetos", dao.buscarPorTecnologia(id));
		}
		
		if(idStatus != null) {
			if(idStatus == 0){
				model.addAttribute("projetos", dao.buscarPorStatus(Status.INICIADO));		
			}else if(idStatus == 1) {
				model.addAttribute("projetos", dao.buscarPorStatus(Status.EM_ANDAMENTO));			
			}else if (idStatus == 2) {
				model.addAttribute("projetos", dao.buscarPorStatus(Status.FINALIZADO));
			}
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
	public String salvar(@Valid Projeto projeto, BindingResult brprojeto, 
			@RequestParam(name = "usuarioCriador.id")Long idUsuario, 
			@RequestParam(name = "tecnologia.id")Long idTecnologia,
			@RequestParam(name = "status")String status,
			Model model) {
		
		System.out.println("AQUI: " + projeto.getStatus());
		
		if (dao.buscarPorNome(projeto.getNome()) != null && dao.buscar(projeto.getId()) == null) {
			brprojeto.addError(new FieldError("projeto", "nome", "O nome já existe"));
		}
		
		if (brprojeto.hasErrors()) {
			System.out.print("ERROS CADASTRAR PROJETO: ");
			System.out.println(brprojeto.getAllErrors());
			return "projeto/novo";
		}
		
		projeto.setUsuarioCriador(daoUsr.buscar(idUsuario));
		projeto.setTecnologia(daoTec.buscar(idTecnologia));
		//projeto.setStatus(status);
		
		switch(status) {
			case "1": 
				projeto.setStatus(Status.EM_ANDAMENTO);					
				break;
			case "2": 
				projeto.setStatus(Status.FINALIZADO);					
				break;
			default: 
				projeto.setStatus(Status.INICIADO);					
		}
				
		if (dao.buscar(projeto.getId()) == null) {
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
