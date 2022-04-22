import { useEffect } from "react"

const ImportScripts = (resourceUrl, onloadScript = '') =>{
    useEffect(() => {
        const script = document.createElement('script');
        script.type ='text/javascript';
        script.async = true;
        script.src = resourceUrl;
        document.body.appendChild(script);
        script.onload = () => {
            if (onloadScript !== ''){
                setTimeout(function () {
                    const script2 = document.createElement('script');
                    script2.type ='text/javascript';
                    script2.async = true;
                    script2.defer = true;
                    script2.textContent = onloadScript;
                    document.body.appendChild(script2);
                }, 0);
            }
        };
        return () => {
            document.body.removeChild(script);
        }
    }, [resourceUrl, onloadScript]);
};
export default ImportScripts;