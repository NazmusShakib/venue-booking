import { useEffect, useState } from "react"

const ImportScript = (resourceUrl, onloadScript = '') =>{
    useEffect(() => {
        const script = document.createElement('script');
        script.type ='text/javascript';
        script.async = true;
        script.src = resourceUrl;
        document.body.appendChild(script);

        const script2 = document.createElement('script');
        script2.type ='text/javascript';
        script2.async = true;
        script2.defer = true;

        if (onloadScript !== ''){
            script.onload = () => {
                script2.textContent = onloadScript;
            };
        }
        document.body.appendChild(script2);
        return () => {
            document.body.removeChild(script);
            document.body.removeChild(script2);
        }
    }, [onloadScript, resourceUrl]);
};
export default ImportScript;