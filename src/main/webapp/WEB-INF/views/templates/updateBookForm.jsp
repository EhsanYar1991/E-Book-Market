<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%--update book Form body ...--%>
<div>
    <form:form action="${pageContext.request.contextPath}/updateBook" method="post" enctype="multipart/form-data" id="addNewBook"
               title="update Book" commandName="updatedBook">

        <form:hidden path="id" class="form-control" id="id" value="${book.id}"/>

        <div class="form-group">
            <label class="control-label" for="title">Title:</label>
            <form:input path="title" class="form-control" id="title" value="${book.title}"/>
        </div>
        <div class="form-group">
            <label class="control-label" for="author">Author:</label>
            <form:input path="author" class="form-control" id="author" value="${book.author}"/>
        </div>
        <div class="form-group">
            <label class="control-label" for="edition">Edition:</label>
            <form:input path="edition" class="form-control" id="edition" value="${book.edition}"/>
        </div>
        <div class="form-group">
            <label class="control-label" for="description">Description:</label>
            <form:textarea path="description" class="form-control" id="description" value="${book.description}"/>
        </div>
        <div class="form-group">
            <label class="control-label" for="numberOfPages">Number of pages::</label>
            <form:input path="numberOfPages" class="form-control" id="numberOfPages" value="${book.numberOfPages}"/>
        </div>
        <div class="form-group">
            <label class="control-label" for="isbn">ISBN:</label>
            <form:input path="isbn" class="form-control" id="isbn" value="${book.isbn}"/>
        </div>
        <div class="form-group">
            <label class="control-label" for="price">Price:</label>
            <form:input path="price" class="form-control" id="price" value="${book.price}"/>
        </div>


        <button type="submit" class="btn btn-success">UPDATE</button>
    </form:form>
</div>