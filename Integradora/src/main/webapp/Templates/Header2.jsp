<%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 07/07/2024
  Time: 04:58 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Importar iconos -->
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="bootstrap" viewBox="0 0 118 94">
        <title>Bootstrap</title>
        <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
    </symbol>
    <symbol id="home" viewBox="0 0 17 17">
        <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
    </symbol>
    <symbol id="speedometer2" viewBox="0 0 16 16">
        <path d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z"/>
        <path fill-rule="evenodd" d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z"/>
    </symbol>
    <symbol id="minus" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M5.5 10C5.5 9.72386 5.72386 9.5 6 9.5H10C10.2761 9.5 10.5 9.72386 10.5 10C10.5 10.2761 10.2761 10.5 10 10.5H6C5.72386 10.5 5.5 10.2761 5.5 10Z" fill="black"/>
        <path d="M8 1C9.38071 1 10.5 2.11929 10.5 3.5V4H5.5V3.5C5.5 2.11929 6.61929 1 8 1ZM11.5 4V3.5C11.5 1.567 9.933 0 8 0C6.067 0 4.5 1.567 4.5 3.5V4H1V14C1 15.1046 1.89543 16 3 16H13C14.1046 16 15 15.1046 15 14V4H11.5ZM2 5H14V14C14 14.5523 13.5523 15 13 15H3C2.44772 15 2 14.5523 2 14V5Z" fill="black"/>
    </symbol>
    <symbol id="plus" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M5.5 10C5.5 9.72386 5.72386 9.5 6 9.5H10C10.2761 9.5 10.5 9.72386 10.5 10C10.5 10.2761 10.2761 10.5 10 10.5H6C5.72386 10.5 5.5 10.2761 5.5 10Z" fill="black"/>
        <path d="M8 1C9.38071 1 10.5 2.11929 10.5 3.5V4H5.5V3.5C5.5 2.11929 6.61929 1 8 1ZM11.5 4V3.5C11.5 1.567 9.933 0 8 0C6.067 0 4.5 1.567 4.5 3.5V4H1V14C1 15.1046 1.89543 16 3 16H13C14.1046 16 15 15.1046 15 14V4H11.5ZM2 5H14V14C14 14.5523 13.5523 15 13 15H3C2.44772 15 2 14.5523 2 14V5Z" fill="black"/>
    </symbol>
    <symbol id="calendar3" viewBox="0 0 16 16">
        <path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"/>
        <path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
    </symbol>
    <symbol id="chat-quote-fill" viewBox="0 0 16 16">
        <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM7.194 6.766a1.688 1.688 0 0 0-.227-.272 1.467 1.467 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 5.734 6C4.776 6 4 6.746 4 7.667c0 .92.776 1.666 1.734 1.666.343 0 .662-.095.931-.26-.137.389-.39.804-.81 1.22a.405.405 0 0 0 .011.59c.173.16.447.155.614-.01 1.334-1.329 1.37-2.758.941-3.706a2.461 2.461 0 0 0-.227-.4zM11 9.073c-.136.389-.39.804-.81 1.22a.405.405 0 0 0 .012.59c.172.16.446.155.613-.01 1.334-1.329 1.37-2.758.942-3.706a2.466 2.466 0 0 0-.228-.4 1.686 1.686 0 0 0-.227-.273 1.466 1.466 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 10.07 6c-.957 0-1.734.746-1.734 1.667 0 .92.777 1.666 1.734 1.666.343 0 .662-.095.931-.26z"/>
    </symbol>
    <symbol id="cpu-fill" viewBox="0 0 16 16">
        <path d="M6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
        <path d="M5.5.5a.5.5 0 0 0-1 0V2A2.5 2.5 0 0 0 2 4.5H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2A2.5 2.5 0 0 0 4.5 14v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14a2.5 2.5 0 0 0 2.5-2.5h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14A2.5 2.5 0 0 0 11.5 2V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5zm1 4.5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5v-3A1.5 1.5 0 0 1 6.5 5z"/>
    </symbol>
    <symbol id="gear-fill" viewBox="0 0 16 16">
        <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
    </symbol>
    <symbol id="clock" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M8.51496 1.01896C8.34401 1.00635 8.17225 1 8 1V0C8.19685 0 8.39314 0.00726199 8.58852 0.0216722L8.51496 1.01896ZM10.5193 1.46905C10.1985 1.34533 9.86912 1.2454 9.53371 1.17008L9.75282 0.194382C10.1361 0.280463 10.5126 0.394665 10.8792 0.536055L10.5193 1.46905ZM11.889 2.17971C11.7458 2.08402 11.5994 1.99388 11.4503 1.90939L11.9432 1.0393C12.1136 1.13586 12.2809 1.23888 12.4446 1.34824C12.6082 1.4576 12.7674 1.5727 12.9219 1.69322L12.3066 2.48158C12.1715 2.37612 12.0322 2.27541 11.889 2.17971ZM13.7231 3.96934C13.5252 3.68829 13.3068 3.42218 13.0697 3.17321L13.794 2.48368C14.0649 2.76821 14.3145 3.07233 14.5407 3.39353L13.7231 3.96934ZM14.4672 5.32122C14.4012 5.16208 14.3296 5.00583 14.2526 4.85271L15.1458 4.40311C15.2339 4.5781 15.3157 4.75667 15.391 4.93853C15.4664 5.12039 15.5348 5.30453 15.5962 5.49054L14.6467 5.80423C14.5929 5.64147 14.5331 5.48035 14.4672 5.32122ZM14.9979 7.82822C14.9895 7.48455 14.9557 7.14197 14.8969 6.80326L15.8822 6.63231C15.9494 7.01939 15.988 7.41092 15.9976 7.80367L14.9979 7.82822ZM14.8655 9.36563C14.8991 9.1967 14.9264 9.02699 14.9474 8.85687L15.9398 8.97929C15.9159 9.17372 15.8847 9.36766 15.8463 9.56072C15.8079 9.75378 15.7625 9.94489 15.7102 10.1337L14.7464 9.867C14.7922 9.70179 14.8319 9.53457 14.8655 9.36563ZM13.914 11.745C14.0979 11.4546 14.2602 11.151 14.3995 10.8367L15.3137 11.2419C15.1545 11.6011 14.969 11.9481 14.7588 12.28L13.914 11.745ZM12.9497 12.9497C13.0715 12.828 13.1885 12.702 13.3005 12.5722L14.0577 13.2254C13.9297 13.3737 13.796 13.5177 13.6569 13.6569L12.9497 12.9497Z" fill="black"/>
        <path d="M8 1C6.84885 1 5.71545 1.2839 4.70022 1.82655C3.68499 2.3692 2.81926 3.15386 2.17971 4.11101C1.54017 5.06816 1.14654 6.16827 1.03371 7.31388C0.920876 8.45949 1.09232 9.61525 1.53285 10.6788C1.97337 11.7423 2.66939 12.6808 3.55925 13.4111C4.44911 14.1414 5.50533 14.6409 6.63437 14.8655C7.76341 15.0901 8.93041 15.0327 10.032 14.6986C11.1336 14.3644 12.1358 13.7637 12.9497 12.9497L13.6569 13.6569C12.7266 14.5871 11.5812 15.2736 10.3223 15.6555C9.06332 16.0374 7.72961 16.1029 6.43928 15.8463C5.14895 15.5896 3.94183 15.0187 2.92486 14.1841C1.90788 13.3495 1.11243 12.2769 0.608966 11.0615C0.105504 9.846 -0.0904279 8.52514 0.0385242 7.21586C0.167476 5.90659 0.617333 4.64933 1.34825 3.55544C2.07916 2.46155 3.06857 1.5648 4.22883 0.94463C5.38909 0.324457 6.68439 0 8 0V1Z" fill="black"/>
        <path d="M7.5 3C7.77614 3 8 3.22386 8 3.5V8.70984L11.2481 10.5659C11.4878 10.7029 11.5711 11.0083 11.4341 11.2481C11.2971 11.4878 10.9917 11.5711 10.7519 11.4341L7.25193 9.43412C7.09615 9.3451 7 9.17943 7 9V3.5C7 3.22386 7.22386 3 7.5 3Z" fill="black"/>
    </symbol>
    <symbol id="toggles2" viewBox="0 0 16 16">
        <path d="M9.465 10H12a2 2 0 1 1 0 4H9.465c.34-.588.535-1.271.535-2 0-.729-.195-1.412-.535-2z"/>
        <path d="M6 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm0 1a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm.535-10a3.975 3.975 0 0 1-.409-1H4a1 1 0 0 1 0-2h2.126c.091-.355.23-.69.41-1H4a2 2 0 1 0 0 4h2.535z"/>
        <path d="M14 4a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"/>
    </symbol>
    <symbol id="tools" viewBox="0 0 16 16">
        <path d="M1 0L0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.356 3.356a1 1 0 0 0 1.414 0l1.586-1.586a1 1 0 0 0 0-1.414l-3.356-3.356a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0zm9.646 10.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708zM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11z"/>
    </symbol>
    <symbol id="chevron-right" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
    </symbol>
    <symbol id="geo-fill" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999zm2.493 8.574a.5.5 0 0 1-.411.575c-.712.118-1.28.295-1.655.493a1.319 1.319 0 0 0-.37.265.301.301 0 0 0-.057.09V14l.002.008a.147.147 0 0 0 .016.033.617.617 0 0 0 .145.15c.165.13.435.27.813.395.751.25 1.82.414 3.024.414s2.273-.163 3.024-.414c.378-.126.648-.265.813-.395a.619.619 0 0 0 .146-.15.148.148 0 0 0 .015-.033L12 14v-.004a.301.301 0 0 0-.057-.09 1.318 1.318 0 0 0-.37-.264c-.376-.198-.943-.375-1.655-.493a.5.5 0 1 1 .164-.986c.77.127 1.452.328 1.957.594C12.5 13 13 13.4 13 14c0 .426-.26.752-.544.977-.29.228-.68.413-1.116.558-.878.293-2.059.465-3.34.465-1.281 0-2.462-.172-3.34-.465-.436-.145-.826-.33-1.116-.558C3.26 14.752 3 14.426 3 14c0-.599.5-1 .961-1.243.505-.266 1.187-.467 1.957-.594a.5.5 0 0 1 .575.411z"/>
    </symbol>
    <symbol id="profile" viewBox="0 0 16 16">
        <path d="M4 16s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-5.95a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
        <path d="M2 1a2 2 0 0 0-2 2v9.5A1.5 1.5 0 0 0 1.5 14h.653a5.4 5.4 0 0 1 1.066-2H1V3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v9h-2.219c.554.654.89 1.373 1.066 2h.653a1.5 1.5 0 0 0 1.5-1.5V3a2 2 0 0 0-2-2z"/>
    </symbol>
</svg>
<%
    HttpSession sesion = (HttpSession) request.getSession();
    String name = (String) sesion.getAttribute("name");
%>
<header>
    <!-- Header -->
    <div class="navbar-expand-lg">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <a id="botoncito" type="button" class="content" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                <svg class="img-fluid" width="45" height="45" viewBox="0 0 45 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect y="34.7727" width="45" height="10.2273" rx="5.11364" fill="white"/>
                    <rect y="17.3864" width="45" height="10.2273" rx="5.11364" fill="white"/>
                    <rect width="45" height="10.2273" rx="5.11364" fill="white"/>
                </svg>
            </a>

            <p id="tituloLogin" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto" style="color: white; margin-left: auto">
                <img src="IMG/cajaIcon.png" alt="Logo" width="50" height="50">
                GESTIÓN DE ALMACÉN
            </p>

            <div class="col-md-3 text-end">
                <div class="dropstart" id="w">
                    <a class="content" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                        <svg id="bt" width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect y="23.1818" width="30" height="6.81818" rx="3.40909" fill="white"/>
                            <rect y="11.5909" width="30" height="6.81818" rx="3.40909" fill="white"/>
                            <rect width="30" height="6.81818" rx="3.40909" fill="white"/>
                        </svg>
                    </a>
                    <a class="btn btn-outline-warning" href="index.jsp" id="salir">
                        CERRAR SESIÓN
                    </a>
                </div>
            </div>
        </header>
        <!-- Offcanvas -->
    </div>
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <svg class="img-fluid" width="45" height="45" viewBox="0 0 45 45" fill="none" xmlns="http://www.w3.org/2000/svg"
                 data-bs-dismiss="offcanvas">
                <rect y="34.7727" width="45" height="10.2273" rx="5.11364" fill="#FFDF8E"/>
                <rect y="17.3864" width="45" height="10.2273" rx="5.11364" fill="#FFDF8E"/>
                <rect width="45" height="10.2273" rx="5.11364" fill="#FFDF8E"/>
            </svg>
        </div>
        <!-- si --><div class="offcanvas-body">
        <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <rect width="40" height="40" fill="url(#pattern0_115_142)"/>
                <defs>
                    <pattern id="pattern0_115_142" patternContentUnits="objectBoundingBox" width="1" height="1">
                        <use xlink:href="#image0_115_142" transform="scale(0.0111111)"/>
                    </pattern>
                    <image id="image0_115_142" width="90" height="90" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAYAAAA4qEECAAAACXBIWXMAAAsTAAALEwEAmpwYAAACjElEQVR4nO2csWoUURSGP1FimsDWKlZaxC42PoLaaKudlZWa0tbO5BGshOgLaOUTqGmMlY2VYmKpMRACikcGZkAHd7PZnJlz5u7/wd/ssCz349+7c7jLgBBCCCGE+JdFYB3YAb4Ca/VrwpEzwFvAWnkHnJdpH1aAT/+R3GQbuCLZx+MWsD9BcpMD4I5kH52T9R5sR8wT4NQMnzeXLAEvZpDc5BUwil5Edi4AH44huclHYDl6MVm5CnxzkNzkB3AjelHZuAv8dJTc5BfwMHpxGVgENjoQ3M7GFMPNwl8DUfv2ca2+PtghZLMHyU02688cx2F3OdX14oYQ6yg7E4abdpPbqcb+QXF7yiGkq4wbbqZ5b9FDiHWU9nBThOgl4GUCuZOGm8GLvug0hHSVZrgZtOjrwPcEMg/LtINSSlbrgcEKSipOA08TSLGSRY87CbFCkoLLwOcEMqxk0dFDiJUuOtsQYiWKHtU3/DZHGfUtOfsQYh0ON5f6knzN+STEBpbq5OZm15JLHEJshvwGHgEnvAVXpwvPEyzQkuWZ98nL4wSLsqSp3LixnWBBljTVyYxE073oL56i52koscitY6GWrS2EmL8h2JwljOiFm0THSzE1mnBh2jrIHe3RSPRg2qdGI9Hhe6ap0RLtSnRrTY2WaFeiW2tqtES7Et1aU6Ml2pXo1poaLdGuRLfW1GiJdiW6taZGS7Qr0a01NVqiXYluranREu1KdGtNjZZoV6Jba2q0RLsS3VpL/i2RaCSa6NambPRegsVbT9mNFN3nAwItOG8iRT9IIMB6yr3ox/q8TyDBOs5WhmeTnitc9hZwliRUzb5f72Ml/EDuAa/r7SK8yUIIIYQQQgghhBAk4w9m9qGhd3r3SQAAAABJRU5ErkJggg=="/>
                </defs>
            </svg>
            <span class="fs-4">¡Hola <%=name%>!</span>
        </a>
        <hr>
        <ul class="dropdown-menu dropdown-menu-dark col" style="display:contents;">
            <li><p><a class="dropdown-item" href="InicioAlmacenista.jsp"><svg class="bi pe-none me-2" width="17" height="17"><use xlink:href="#home"/></svg> Menu principal</a></p></li>
            <li><hr class="dropdown-divider"></li>
            <li><p><a class="dropdown-item" href="registrarEntrada.jsp"><svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#plus"/></svg> Registrar entradas</a></p></li>
            <li><hr class="dropdown-divider"></li>
            <li><p><a class="dropdown-item" href="registrarSalida.jsp"><svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#minus" fill="black"/></svg>  Registrar salidas</a></p></li>
            <li><hr class="dropdown-divider"></li>
            <li><p><a class="dropdown-item" href="menuHist.jsp"><svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#clock" fill="black"/></svg> Ver historial</a></p></li>
            <li><hr class="dropdown-divider"></li>
            <li><p><a class="dropdown-item" href="pendientes.jsp"> <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#chat-quote-fill"/></svg> Pendientes</a></p></li>
            <li><hr class="dropdown-divider"></li>
        </ul>
        <hr>
        <p id="copy">© 2024 SGA</p>
        </div>
    </div> <!-- si -->
</header>
<style>
    .offcanvas-header{
        background-color: #1E1E1E;
    }

    hr, strong{
        color: #ffffff;
    }

    .offcanvas-body{
        background-color: #3C3C3C;
    }

    #copy{
        color: #D2D2D2;
        font-style: italic;
        text-align: center;
    }

    @media (min-width: 577px) {
        #textheader2{
            text-align: center;
            align-items: center;
            justify-content: center;
        }
        #bt{
            display: none;
        }
        #botoncito{
            margin-left: 10px;
        }
    }
    @media (max-width: 576px) {
        #bt{
            display: inline;
        }
        #botoncito{
            display: none;
        }
    }

    .dropdown-divider{
        color: black;
    }

    .dropdown-item:active{
        background-color: #E63946;
    }

    #salir{
        font-style: "inter";
        margin-right: 10px;
        font-weight: bold;
    }

    #salir:hover{
        color: white;
    }

    .dropdown-item{
        font-size: larger;
    }
    /*Aqui terminan*/
</style>
<!--  Antes de añadir el header, recuerda que solo se cierra dicha etiqueta, body y html NO-->