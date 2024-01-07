window.addEventListener('load', function() {
    var redirect = this.confirm("Sucessfully created a Session. Create another session?");

    if (redirect==true) {
        location. href = 'hospital_newAppointment.jsp';
    }
    else{
        location. href = 'hospital_Dashboard.jsp';
    }
});