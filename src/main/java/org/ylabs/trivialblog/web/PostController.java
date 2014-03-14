package org.ylabs.trivialblog.web;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.ylabs.trivialblog.Post;

@RequestMapping({"/posts", "/"})
@Controller
@RooWebScaffold(path = "posts", formBackingObject = Post.class)
public class PostController {
}
