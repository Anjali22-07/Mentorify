
package com.tech.blog.entities;

/**
 *
 * @author Anjali Singh
 */
//iska object message ko represent krega
//ye message ko store krega jo loginpage pe display hoga
public class Message {
    
    private String content;    //stores about the contect of the message
    
    private String type;    //type  of the message
    private String CssClass;

    public Message(String content, String type, String CssClass) {
        this.content = content;
        this.type = type;
        this.CssClass = CssClass;
        
        
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssClass() {
        return CssClass;
    }

    public void setCssClass(String CssClass) {
        this.CssClass = CssClass;
    }
            
            
}
