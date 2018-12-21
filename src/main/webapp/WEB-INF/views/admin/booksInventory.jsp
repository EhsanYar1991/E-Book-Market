<%@include file="../templates/header.jsp" %>


<div class="container marketing">

    <!-- Button trigger add book modal -->
    <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#addBookModal">Add new Book
    </button>

    <!--Add Book Modal -->
    <div class="modal fade" id="addBookModal" tabindex="-1" role="dialog" aria-labelledby="addBookModalLable">
        <div class="modal-dialog" role="form">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addBookModalLable">Add new Book</h4>
                </div>
                <div class="modal-body">
                    <%@include file="../templates/addNewBookForm.jsp" %>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <c:forEach items="${books}" var="book">
            <div class="col-lg-4">
                <img class="img-circle"
                     src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
                     alt="Generic placeholder image" width="140" height="140">
                <h2>${book.title}</h2>
                <h3>by: ${book.author}</h3>
                <p>${book.edition}th edition</p>
                <p>${book.description}</p>


                <!-- Button trigger modal -->
                <button type="button" class="btn btn-default btn-sm" data-toggle="modal"
                        data-target="#myModal${book.id}">View details
                </button>

                <!-- Modal -->
                <div class="modal fade" id="myModal${book.id}" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">${book.title}</h4>
                            </div>
                            <div class="modal-body">
                                <%@include file="../templates/bookDetail.jsp" %>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                            </div>
                        </div>
                    </div>
                </div>


                <!-- Button trigger update modal -->
                <button type="button" class="btn btn-default btn-sm" data-toggle="modal"
                        data-target="#updateBookModal${book.id}">Update
                </button>

                <!-- Update Modal -->
                <div class="modal fade" id="updateBookModal${book.id}" tabindex="-1" role="dialog"
                     aria-labelledby="updateBookModalLabel">
                    <div class="modal-dialog" role="form">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="updateBookModalLabel">update book: ${book.title}</h4>
                            </div>
                            <div class="modal-body">
                                <%@include file="../templates/updateBookForm.jsp" %>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
                <!-- Button remove selected Book -->
                <a href="${pageContext.request.contextPath}/removeBook/${book.id}" ><button type="button"  class="btn btn-danger btn-sm">Remove</button></a>

            </div>
            <!-- /.col-lg-4 -->
        </c:forEach>
    </div>
    <!-- /.row -->


</div>

<!-- FOOTER -->
<%@include file="../templates/footer.jsp" %>

