using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    public class LoginResponse
    {
        public LoginResponse(string nick, string token)
        {
            Nick = nick;
            Token = token;
        }

        public string Nick { get; set; }
        public string Token { get; set; }
    }
}