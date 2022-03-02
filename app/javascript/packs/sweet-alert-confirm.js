import Rails from '@rails/ujs';
import swal from 'sweetalert';

// Display the confirmation dialog
const showConfirmationDialog = (element) => {
    const message = element.getAttribute('data-confirm-swal');
    const text    = element.getAttribute('data-text');

    swal({
        title:      message || 'Are you sure?',
        text:       text || '',
        icon:       'warning',
        buttons:    true,
        dangerMode: true,
    }).then((isConfirm) => {
        if (isConfirm) {
            console.log(element.getAttribute('href'));
            $.ajax({
                method: element.getAttribute('data-method') || 'GET',
                url: element.getAttribute('href'),
                dataType: 'json',
                success: function(result) {
                    console.log(result)
                    swal('Success!', result.message || '', 'success')
                        .then((_result) => {
                            location.reload();
                        });
                },
                error: function(xhr) {
                    let title   = 'Error!';
                    let message = 'Something went wrong. Please try again later.';

                    if (xhr.responseJSON && xhr.responseJSON.message) {
                        message = xhr.responseJSON.message;
                    }
                    swal(title, message,'error');
                }
            });
        } else {
            element.removeAttribute('data-confirm-swal');
            element.click();
        }
    });
};

const allowAction = (element) => {
    if (element.getAttribute('data-confirm-swal') === null) {
        return true;
    }

    showConfirmationDialog(element);
    return false;
};

function handleConfirm(element) {
    if (!allowAction(this)) {
        Rails.stopEverything(element);
    }
}

Rails.delegate(document, 'a[data-confirm-swal]', 'click', handleConfirm);