import { useEffect} from "react"

const AppendScripts = (scripts) =>{
    useEffect(() => {
        const script = document.createElement('script');
        script.type ='text/javascript';
        script.async = true;
        script.defer = true;
        script.textContent = scripts;
        document.body.appendChild(script);
        return () => {
            document.body.removeChild(script);
        }
    }, [scripts]);
};
export default AppendScripts;