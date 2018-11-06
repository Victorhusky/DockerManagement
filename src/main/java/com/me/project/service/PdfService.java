package com.me.project.service;

import com.github.dockerjava.api.model.Info;
import com.github.dockerjava.api.model.Version;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.PdfCopy;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import javax.swing.JFileChooser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service

public class PdfService {
	@Autowired
	SettingService settingSrv;	
	
	  public static void PrintPDF(Info info, Version version) {   
	        // 模板路径  
		    System.out.println("I am in pdf");
	        String templatePath ="/Users/victor/Desktop/DockerInfo.pdf";  
	        String newPDFPath = "src/data";
	        
	        PdfReader reader;  
	        FileOutputStream out;  
	        ByteArrayOutputStream bos;  
	        PdfStamper stamper;  
	       
	         
	        try {  
	        	  reader = new PdfReader(templatePath);// 
		          System.out.println("number of orignial page"+reader.getNumberOfPages());
	        	
	        	System.out.println("Out problem");
	            out = new FileOutputStream("/Users/victor/Desktop/1.pdf");//
	          
	            bos = new ByteArrayOutputStream();  
	            stamper = new PdfStamper(reader, bos);  
	            AcroFields form = stamper.getAcroFields();  
	            
	            int i = 0;  
	            java.util.Iterator<String> it = form.getFields().keySet().iterator();  
	            System.out.println("number of orignial page"+reader.getNumberOfPages());
	            String imagenum = info.getImages()+"";
	            String connum= info.getContainers()+"";
	            String debugnum=info.getContainers()+"";
	            String driver =info.getDriver();
	            String edriver =info.getExecutionDriver();
	            String indexServer =info.getIndexServerAddress();
	            String initPath=info.getInitPath();
	            
	            String kversion=version.getKernelVersion();
	            String apiversion=version.getApiVersion();
	            String platform =version.getArch();
	            String gitcommit=version.getGitCommit();
	            String goversion =version.getGoVersion();
	            String os=version.getOperatingSystem();
	            String dockerversion =version.getVersion();
	            Date date =new Date();
	            String dd=date.toString();
	            String str[] ={imagenum,connum,debugnum,driver,edriver,indexServer,initPath,kversion,apiversion,platform,gitcommit,goversion,os,dockerversion,dd,"s"};
	            
	            while (it.hasNext()) {  
	                String name = it.next().toString();  
	                  
	                form.setField(name, str[i++]);  System.out.println("number of orignial page"+reader.getNumberOfPages());
	                System.out.println(i);
	            }  
	            
	            stamper.setFormFlattening(true);// 如果为false那么生成的PDF文件还能编辑，一定要设为true  
	            stamper.close();  
	  
	            Document doc = new Document();  
	            PdfCopy copy = new PdfCopy(doc, out);  
	            doc.open();  
	            
	            PdfImportedPage importPage = copy.getImportedPage(new PdfReader(bos.toByteArray()), 1);  
	            copy.addPage(importPage);  
	             
	             
	            System.out.println("Finish with path" +newPDFPath);
	            doc.close();  
	  
	        } catch (IOException e) {  
	            System.out.println("IO exception");  
	        } catch (DocumentException e) {  
	            System.out.println(2);  
	        } 
	  
	    }  
}
