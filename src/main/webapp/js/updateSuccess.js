window.addEventListener('load', function() {
    var redirect = this.confirm("Profile updated successfully. Do more changes?");

    if (redirect==true) {
        location. href = 'hospital_profile.jsp';
    }
    else{
        location. href = 'hospital_Dashboard.jsp';
    }
});