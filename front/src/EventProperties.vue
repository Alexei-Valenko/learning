<template>
     <div>
        <strong> Edit Event </strong>
        <input type="text" placeholder="Enter date(YYYY-MM-DD)" v-model="event.date"/>
        <input type="text" placeholder="Enter hour" v-model="event.hour"/>
        <input type="text" placeholder="Enter length" v-model="event.length"/>
        <button v-on:click="submit"> Save </button>
        <button v-on:click="cancel"> Cancel </button>
    </div>
</template>

<script>
export default {
    props:['event'],
    methods: {
        submit() {
             this.axios.patch(`/api/events/`+ this.event.id, { date: this.event.date + 'T' + this.event.hour + ':00:00Z' , length: this.event.length})
                .then(
                    response => {
                        this.$emit('updated');
                    },
                     error => console.log(error)
                );
        },

        cancel() {
          this.$emit('hide-event-properties');
        }
    }
}
</script>