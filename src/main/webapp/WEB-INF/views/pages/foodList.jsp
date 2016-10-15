 <table class="table table-bordered" id="tables">

            <thead>
                <tr>
                    <th>S.N</th>
                    <th>Food Name</th>
                    <th>Price</th>
                    <th>Entry Added</th>

                </tr>
            </thead>
            <tbody>


            </tbody>

            <c:forEach items="${foodItem}" var="foodItem" varStatus="countt">

                <tr>

                    <td>${countt.count}</td>
                    <td>${foodItem.foodName}</td>
                    <td>${foodItem.price}</td>
                    <td>
                        <fmt:formatDate value="${foodItem.date}" pattern="yyyy-MMM-dd"/></td>
                    <td><a href="edit-${foodItem.id}" class="btn btn-warning" role="button">Edit</a></td>
                    <td><a href="delete?id=${foodItem.id}" class="btn btn-danger" role="button">delete</a></td>


                </tr>

            </c:forEach>
        </table>
