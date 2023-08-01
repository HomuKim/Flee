package com.flee.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.member.service.JoinService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class JoinController {

   private JoinService joinService;

   @RequestMapping(value="/joinForm.fe")
   public ModelAndView joinForm(CommandMap commandMap) throws Exception{
      ModelAndView mv=new ModelAndView("join/joinForm");
      return mv;      
   }
   
   /* 회원가입 */
   @RequestMapping(value="/joinSuccess.fe", method=RequestMethod.POST)
   public ModelAndView memberVerify(CommandMap commandMap) throws Exception{
     ModelAndView mv=new ModelAndView("redirect:/main.fe");
     joinService.insertMember(commandMap.getMap()); 
     
     Map<String, Object> map=new HashMap<>();
     map.put("FASHION", commandMap.getMap().get("FASHION"));
     map.put("BEAUTY", commandMap.getMap().get("BEAUTY"));
     map.put("ELECTRONIC", commandMap.getMap().get("ELECTRONIC"));
     map.put("DRAWING", commandMap.getMap().get("DRAWING"));
     map.put("WORKOUT", commandMap.getMap().get("WORKOUT"));
     map.put("STUDY", commandMap.getMap().get("STUDY"));
     map.put("FILM", commandMap.getMap().get("FILM"));
     map.put("ANIMAL", commandMap.getMap().get("ANIMAL"));
     map.put("M_NICKNAME", commandMap.getMap().get("M_NICKNAME"));
     joinService.insertMemberCategory(map);
     
     return mv;
   }

   /* id중복체크 */
   @RequestMapping(value="/confirmEmail.fe", method=RequestMethod.POST)
   @ResponseBody
   public boolean checkEmail(@RequestParam String email)throws Exception{
      
      int check=joinService.getEmailCheck(email);
      
      if(check>0) {
         return true;
      }else 
         return false;
   }
   /* 닉네임 중복체크 */
   @RequestMapping(value="/confirmNickname.fe", method=RequestMethod.POST)
   @ResponseBody
   public boolean checkNick(@RequestParam String nick)throws Exception{
      
      int check=joinService.getNickCheck(nick);
      if(check>0) {
         return true;
      }else 
         return false;
   }


}