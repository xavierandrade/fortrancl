Waits on the host thread for commands identified by event objects to complete.

Interface to OpenCL [clWaitForEvents](http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/clWaitForEvents.html).

```Fortran

subroutine clWaitForEvents(event_list, errcode_ret)
type(cl_event),         intent(in)    :: event_list
integer,                intent(out)   :: errcode_ret
end subroutine clWaitForEvents

subroutine clWaitForEvents_array(event_list, errcode_ret)
type(cl_event),         intent(in)    :: event_list(:)
integer,                intent(out)   :: errcode_ret
end subroutine clWaitForEvents
```

### Parameters ###

`event_list`

> The events specified in event\_list act as synchronization points.

### Notes ###

Waits on the host thread for commands identified by event objects in event\_list to complete. A command is considered complete if its execution status is `CL_COMPLETE` or a negative value.

If the `cl_khr_gl_event` extension is enabled, event objects can also be used to reflect the status of an OpenGL sync object. The sync object in turn refers to a fence command executing in an OpenGL command stream. This provides another method of coordinating sharing of buffers and images between OpenGL and OpenCL.

### Errors ###

Returns `CL_SUCCESS` if the execution status of all events in event\_list is `CL_COMPLETE`. Otherwise, it returns one of the following errors:

  * `CL_INVALID_VALUE` if num\_events is zero or event\_list is NULL..
  * `CL_INVALID_CONTEXT` if events specified in event\_list do not belong to the same context.
  * `CL_INVALID_EVENT` if event objects specified in event\_list are not valid event objects.
  * `CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST` if the execution status of any of the events in event\_list is a negative integer value.
  * `CL_OUT_OF_RESOURCES` if there is a failure to allocate resources required by the OpenCL implementation on the device.
  * `CL_OUT_OF_HOST_MEMORY` if there is a failure to allocate resources required by the OpenCL implementation on the host.