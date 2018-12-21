<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--Add new Book Form Body--%>
<form:form action="${pageContext.request.contextPath}/addNewBook" method="post" enctype="multipart/form-data" id="addNewBook"
           title="Add new Book" commandName="newBook">
    <div class="form-group">
        <label class="control-label" for="title">Title:</label>
        <form:input path="title" class="form-control" id="title"/>
    </div>
    <div class="form-group">
        <label class="control-label" for="author">Author:</label>
        <form:input path="author" class="form-control" id="author"/>
    </div>
    <div class="form-group">
        <label class="control-label" for="edition">Edition:</label>
        <form:input path="edition" class="form-control" id="edition"/>
    </div>
    <div class="form-group">
        <label class="control-label" for="description">Description:</label>
        <form:textarea path="description" class="form-control" id="description"/>
    </div>
    <div class="form-group">
        <label class="control-label" for="numberOfPages">Number of pages::</label>
        <form:input path="numberOfPages" class="form-control" id="numberOfPages"/>
    </div>
    <div class="form-group">
        <label class="control-label" for="isbn">ISBN:</label>
        <form:input path="isbn" class="form-control" id="isbn"/>
    </div>
    <div class="form-group">
        <label class="control-label"  for="price">Price:</label>
        <form:input path="price" class="form-control" id="price"/>
    </div>
    <div class="form-group">
        <label class="control-label" for="file">Book File:</label>
        <form:input path="file" class="form:input-large" id="file" type="file"/>
    </div>


    <button type="submit" class="btn btn-success">ADD</button>
</form:form>