window.onload = function() {
    let postList = document.querySelectorAll('li:nth-child(n+4)');
    let button = document.getElementById('show-more-button');
    console.log(button)
    
    button.addEventListener('click', function ()
    {
        for (let i = 0; i < postList.length; i++)
        {
            console.log(postList[i].style.display)
            if (postList[i].style.display === 'none' || postList[i].style.display === '')
            {
                postList[i].style.display = 'flex';
                document.getElementById("show-more-button").innerText = "Show Less";
            } else
            {
                postList[i].style.display = 'none';
                document.getElementById("show-more-button").innerText = "Show More";
            }
    
        }
    });
}


