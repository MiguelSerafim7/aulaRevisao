package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Genero;
import application.model.Livro;
import application.repository.GeneroRepository;
import application.repository.LivroRepository;

@Controller
@RequestMapping("/livros")
public class LivroController {
    
    @Autowired
    private LivroRepository livroRepo;

    @Autowired
    private GeneroRepository generoRepo;

    @RequestMapping("/insert")
    public String insert(Model ui) {
        ui.addAttribute("generos", generoRepo.findAll());
        return "/livro/insert";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam("titulo") String titulo, @RequestParam("genero") long generoId) {
        Optional<Genero> resultado = generoRepo.findById(generoId);
        if(resultado.isPresent()) {
            Livro livro = new Livro();
            livro.setTitulo(titulo);
            livro.setGenero(resultado.get());
            
            livroRepo.save(livro);
        }

        return "redirect:/livros/list";
    }

    @RequestMapping("/list")
    public String list(Model ui) {
        ui.addAttribute("livros", livroRepo.findAll());
        return "/livro/list";
    }

}