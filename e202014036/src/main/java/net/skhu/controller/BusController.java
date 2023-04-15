package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.dto.Bus;
import net.skhu.dto.Category;
import net.skhu.mapper.BusMapper;
import net.skhu.mapper.CategoryMapper;

@Controller
@RequestMapping("bus")
public class BusController {

    @Autowired
    private BusMapper busMapper;

    @Autowired
    private CategoryMapper categoryMapper;

    @GetMapping("list")
    public String list(Model model) {
        List<Bus> buses = busMapper.findAll();
        model.addAttribute("buses", buses);
        return "bus/list";
    }

    @GetMapping("create")
    public String create(Model model) {
        Bus bus = new Bus();
        List<Category> categories = categoryMapper.findAll();
        model.addAttribute("bus", bus);
        model.addAttribute("categories", categories);
        return "bus/edit";
    }

    @PostMapping("create")
    public String create(Bus bus) {
        busMapper.insert(bus);
        return "redirect:/bus/list";
    }

    @GetMapping("edit")
    public String edit(Model model, int id) {
        Bus bus = busMapper.findOne(id);
        List<Category> categories = categoryMapper.findAll();
        model.addAttribute("bus", bus);
        model.addAttribute("categories", categories);
        return "bus/edit";
    }

    @PostMapping("edit")
    public String edit(Bus bus) {
        busMapper.update(bus);
        return "redirect:/bus/list";
    }

    @GetMapping("delete")
    public String delete(Model model, int id) {
        busMapper.delete(id);
        return "redirect:list";
    }
}
