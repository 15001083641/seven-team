package com.jk.controller.tree;

import com.jk.model.tree.Tree;
import com.jk.service.tree.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "tree")
public class TreeController {

    @Autowired
    private TreeService treeService;

    //查询树
    //递归查询树
    @RequestMapping(value = "queryTree")
    @ResponseBody
    public List<Map<String,Object>> getTree(){
        List<Tree> list =treeService.getTree();
        return treestr(list,0);
    }

    public List<Map<String,Object>> treestr(List<Tree>list,Integer pid){
        List<Map<String,Object>> newlist = new ArrayList<Map<String, Object>>();
        for (int i = 0; i < list.size(); i++) {
            Map<String,Object> map = null;
            Tree tree = list.get(i);
            if(tree.getPid()==pid){
                map = new HashMap<String, Object>();
                map.put("id",tree.getId());
                map.put("text",tree.getText());
                map.put("url",tree.getUrl());
                map.put("state",tree.getState());
                map.put("iconCls",tree.getIconCls());
                map.put("name",tree.getName());
                map.put("children",treestr(list,tree.getId()));
            }
            if(map!=null){
                List<Map<String,Object>> li = (List<Map<String, Object>>) map.get("children");
                if(li.size()<=0){
                    li.remove("children");
                }
                newlist.add(map);
            }
        }
        return newlist;

    }

}
