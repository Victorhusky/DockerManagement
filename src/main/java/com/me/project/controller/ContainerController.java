package com.me.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.dockerjava.api.command.InspectContainerResponse;
import com.me.project.dao.ContainerDao;
import com.me.project.pojo.MyContainer;
import com.me.project.service.ContainerService;
import com.me.project.service.EmailService;

@Controller
@RequestMapping("/containers")
public class ContainerController {

	@Autowired
	ContainerService containerSrv;
	@Autowired
	ContainerDao containerDao;
	@Autowired
	EmailService emailSrv;
	  @RequestMapping("/create")
	    public @ResponseBody String create(
	            @RequestParam(value = "image") String image,
	            @RequestParam(value = "name") String name,
	            @RequestParam(value = "cmd") String cmd,
	            @RequestParam(value = "ports") String ports) throws Exception {
	        containerSrv.create(image, name, cmd, ports);
	        MyContainer con =new MyContainer();
	        con.setName(name);
	        con.setFromImage(image);
	        con.setPorts(ports);
	        con.setCreatedTime((new Date()));
	        containerDao.addContainer(con);
	        
	       System.out.println("Here is I create a New Container!"+ name +" Ports" + ports +"cmd" +cmd);
	       return "ok";
	    }
	  
	  @RequestMapping("/list")
	    public String list(Model mode) {
		  	List list =containerSrv.list();
		  	System.out.println("Here is the Container Numbers  :"+ list.size());
	        mode.addAttribute("list", list);
	        
	        return "containerlist";
	    }
	  
	    @RequestMapping("/stop")
	    public String stop(@RequestParam(value="name")String id) {
	    	System.out.println("Here I am in stop berfore service ");
	        containerSrv.stop(id);
	        System.out.println("Here I am in stop container controller");
	        return "redirect:/containers/list";
	    }

	    @RequestMapping("/restart")
	    public String restart(@RequestParam(value="name")String id) {
	        containerSrv.restart(id);
	        System.out.println("Here is restart Controller");
	        return "redirect:/containers/list";
	    }

	    @RequestMapping("/kill")
	    public String kill(@RequestParam(value="name")String id) {
	        
	        System.out.println("Here is kill Controller");
	        containerSrv.kill(id);
	        return "redirect:/containers/list";
	    }

	    @RequestMapping("/pause")
	    public String pause(@RequestParam(value="name")String id) {
	        containerSrv.pause(id);
	        System.out.println("Here is pause Controller");
	        return "redirect:/containers/list";
	    }

	    @RequestMapping("/unpause")
	    public String unpause(@RequestParam(value="name")String id) {
	        containerSrv.unPause(id);
	        System.out.println("Here is unpause Controller");
	        return "redirect:/containers/list";
	    }

	    @RequestMapping("/commit")
	    public String commit(@RequestParam(value="name")String id) {
	        containerSrv.commit(id);
	        System.out.println("Here is commit Controller");
	        return "redirect:/containers/list";
	    }

	    @RequestMapping("/delete")
	    public String delete(@RequestParam(value="name")String id) {
	        containerSrv.delete(id);
	        emailSrv.sendEmail(id,"Container");
	        System.out.println("Here is delete Controller");
	        return "redirect:/containers/list";
	    }

	    @RequestMapping("/{id}/info")
	    public String info(@PathVariable String id, Model model) {
	    	System.out.println("Here is Info Controller!");
	        InspectContainerResponse icr = containerSrv.info(id);
	        model.addAttribute("info", icr);
	        model.addAttribute("title", icr.getName());
	        return "containerinfo";
	    }

	    @RequestMapping("/{id}/log")
	    public String log(@PathVariable String id, Model model) {
	        String log = "Error Log";
	        System.out.println("Here is Log Controller");
	        try {
	            log = containerSrv.log(id);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        model.addAttribute("log", log);
	        return "containerlog";
	    }

	  
}
