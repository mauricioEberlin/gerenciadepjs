package br.senai.sp.info.gerenciadepjs.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.senai.sp.info.gerenciadepjs.dao.UsuarioDAO;
import br.senai.sp.info.gerenciadepjs.model.Permissao;
import br.senai.sp.info.gerenciadepjs.model.Usuario;
import br.senai.sp.info.gerenciadepjs.utils.EmailUtils;

@Controller
public class UsuarioController {
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@GetMapping(value = {"/", "", "/index"})
	public String AbrirLogin(Model model) {
		model.addAttribute("usuario", new Usuario());
		return "index";
	}
	
	@PostMapping({"/usuario/autenticar"})
	public String autenticar(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult br, HttpSession session) {
		usuario.hashearSenha();
		
		Usuario usuarioBuscado = usuarioDAO.buscarPorEmailESenha(usuario.getEmail(), usuario.getSenha());
		if(usuarioBuscado == null) {
			br.addError(new FieldError("usuario", "email", "E-mail ou senha incorretos"));
		}
		
		if(br.hasFieldErrors("email") || br.hasFieldErrors("senha")) {
			System.out.println("Erro: " + br);
			return "index";
		}
		
		session.setAttribute("usuarioAutenticado", usuarioBuscado);
		return "redirect:/app/tecnologia";
	}
	
	@GetMapping("/app/adm/usuario")
	public String abrirLista(@RequestParam (name = "id", required = false)Long id, Model model) {
		if (id != null) {
			model.addAttribute("usuario", usuarioDAO.buscar(id));
			return "usuario/form";
		}else{
			model.addAttribute("usuarios", usuarioDAO.buscarTodos());
			return "usuario/menu";
		}
	}
	
	@GetMapping("/app/adm/usuario/novo")
	public String FormNovoUsuario(Model model) {
		
		model.addAttribute("usuario", new Usuario());
		
		return "usuario/form";
	}
	
	@PostMapping(value = {"/app/adm/usuario/salvar"})
	public String salvar(@Valid Usuario usuario, BindingResult brUsuario,
		                  @RequestParam(name = "isAdministrador", required = false)Boolean ehAdministrador) {

		if(usuario.getId() == null) {
		
			if (usuarioDAO.buscarPorEmail(usuario.getEmail()) != null) {
				brUsuario.addError(new FieldError("usuario", "email", "O e-mail ja existe"));
			}	
			if (brUsuario.hasErrors()) {				
				return "usuario/form";
			}
		
		}else {
			if (brUsuario.hasFieldErrors("nome") || brUsuario.hasFieldErrors("sobrenome")) {
				return "usuario/form";
			}
		}
		
		System.out.println("É administrador: " + ehAdministrador);
		if (ehAdministrador != null) {
			usuario.setPermissao(Permissao.ADMINISTRADOR);
		}else {
			usuario.setPermissao(Permissao.COORDENADOR);
		}
		
		if (usuario.getId() == null) {
			usuario.hashearSenha();
			usuarioDAO.persistir(usuario);
			
			/*String titulo = "Bem-Vindo a BQR";
			String corpo = "Olá, " + usuario.getNome() + "! Seja bem-vindo a BRQ. ";
					//+"Acesse o link: localhost:8080/jc/ para realizar o login.";
			
			try {
				EmailUtils.enviarEmail(titulo, corpo, usuario.getEmail());
			}catch (MessagingException e) {
				e.printStackTrace();
			}*/
		}else {
			Usuario usuarioBanco = usuarioDAO.buscar(usuario.getId());
			usuarioBanco.setNome(usuario.getNome());
			usuarioBanco.setSobrenome(usuario.getSobrenome());
			usuarioBanco.setPermissao(usuario.getPermissao());
			
			usuarioDAO.alterar(usuarioBanco);
		}
		
		return "redirect:/app/adm/usuario";
	}
	
	@GetMapping({"/sair"})
	public String logout() {
		return "redirect:/";
	}	
}
