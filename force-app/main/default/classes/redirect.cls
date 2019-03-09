public class redirect {
    public PageReference hello1() {
        PageReference reference=new PageReference('http://www.google.com');
        reference.setRedirect(true);
        return reference;
    }
    
        public PageReference overrideNew() {
        PageReference reference=new PageReference('https://svmxc.cs11.visual.force.com/apex/ServiceMaxConsole?SVMX_processId=Manage_PM_Template_CCE&SVMX_retURL=..%2Fa6u');
        reference.setRedirect(true);
        return reference;
    }
}