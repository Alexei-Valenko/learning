<template>
    <div>
        <h1>Table of events</h1>
        <table>
            <tr>
                <th>Date</th>
                <th>Hour</th>
                <th>Length</th>
            </tr>
            <tr>
                <th>1</th>
                <th>1</th>
                <th>1</th>
            </tr>
        </table>
    </div>
</template>

<script>

export default {
    data() {
        return {
            name: 'Tmp' ,
            events: []
        }
    },
    methods: {

    },
    created() {
        this.$http.get('http://localhost:3000/trainer/:id/events')
            .then(
                response => response.json(),
                response => alert("error")
            )
            .then(events => this.events = events);
    }
}
</script>
